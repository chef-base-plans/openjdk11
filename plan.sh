pkg_origin=core
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_name=openjdk11
# NOTE: Retrieve download link and shasum from here: https://adoptopenjdk.net/releases.html
pkg_version=11.0.11
pkg_patch_lvl=9
pkg_source="https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-${pkg_version}%2B${pkg_patch_lvl}/OpenJDK11U-jdk_x64_linux_hotspot_${pkg_version}_${pkg_patch_lvl}.tar.gz"
pkg_shasum=e99b98f851541202ab64401594901e583b764e368814320eba442095251e78cb
pkg_filename="OpenJDK11U-jdk_x64_linux_hotspot_${pkg_version}_${pkg_patch_lvl}.tar.gz"
pkg_dirname="jdk-${pkg_version}+${pkg_patch_lvl}"
pkg_license=("GPL-2.0-only WITH Classpath-exception-2.0")
pkg_description=('OpenJDK is a free and open-source implementation of the Java Platform, Standard Edition. AdoptOpenJDK provides binaries from the upstream OpenJDK source code.')
pkg_upstream_url=https://adoptopenjdk.net/about.html
pkg_deps=(
  core/alsa-lib
  core/freetype
  core/gcc-libs
  core/glibc
  core/libxext
  core/libxi
  core/libxrender
  core/libxtst
  core/xlib
  core/zlib
)
pkg_build_deps=(core/patchelf core/rsync)
pkg_bin_dirs=(bin)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)

source_dir=$HAB_CACHE_SRC_PATH/${pkg_dirname}

do_setup_environment() {
 set_runtime_env JAVA_HOME "$pkg_prefix"
}

do_build() {
  return 0
}

do_install() {
  pushd "${pkg_prefix}" || exit 1
  rsync -avz "${source_dir}/" .

  export LD_RUN_PATH="${LD_RUN_PATH}:${pkg_prefix}/lib/jli:${pkg_prefix}/lib/server:${pkg_prefix}/lib"

  build_line "Setting interpreter for all executables to '$(pkg_path_for glibc)/lib/ld-linux-x86-64.so.2'"
  build_line "Setting rpath for all libraries to '$LD_RUN_PATH'"

  find "$pkg_prefix"/bin -type f -executable \
    -exec sh -c 'file -i "$1" | grep -q "x-pie-executable; charset=binary"' _ {} \; \
    -exec patchelf --interpreter "$(pkg_path_for glibc)/lib/ld-linux-x86-64.so.2" --set-rpath "${LD_RUN_PATH}" {} \;

  find "$pkg_prefix/lib" -type f -name "*.so" \
    -exec patchelf --set-rpath "${LD_RUN_PATH}" {} \;

  popd || exit 1
}

do_strip() {
  return 0
}
