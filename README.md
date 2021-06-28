[![Build Status](https://dev.azure.com/chefcorp-partnerengineering/Chef%20Base%20Plans/_apis/build/status/chef-base-plans.openjdk11?branchName=master)](https://dev.azure.com/chefcorp-partnerengineering/Chef%20Base%20Plans/_build/latest?definitionId=275&branchName=master)

# openjdk11

OpenJDK is a free and open-source implementation of the Java Platform, Standard Edition. It is the result of an effort Sun Microsystems began in 2006. The implementation is licensed under the GNU General Public License version 2 with a linking exception. See [documentation](https://openjdk.java.net).

Eclipse Adoptium (AdoptOpenJDK) is the binary provider to allow for continued minor version and patch updates since Oracle's public update period for OpenJDK 11 ended after March 2019 (6 months after the initial September 2018 release per Oracle's standard OpenJDK public updates period). See ['Java is Still Free'](https://docs.google.com/document/d/1nFGazvrCvHMZJgFstlbzoHjpAVwv5DEdnaBr_5pKuHo/preview#), "Backing Adoptium (previously AdoptOpenJDK) is Alibaba, Amazon, Azul, Huawei, IBM, Microsoft, Pivotal, Red Hat, and many others."

## Maintainers

* The Core Planners: <chef-core-planners@chef.io>

## Type of Package

Binary package

### Use as Dependency

Binary packages can be set as runtime or build time dependencies. See [Defining your dependencies](https://docs.chef.io/habitat/plan_writing/#define-your-dependencies) for more information.

To add core/openjdk11 as a dependency, you can add one of the following to your plan file.

#### Buildtime Dependency

> pkg_build_deps=(core/openjdk11)

#### Runtime dependency

> pkg_deps=(core/openjdk11)

### Use as Tool

#### Installation

To install this plan, you should run the following commands to first install, and then link the binaries this plan creates.

``hab pkg install core/openjdk11 --binlink``

will add the following binaries to the PATH:

* /bin/jaotc
* /bin/jar
* /bin/jarsigner
* /bin/java
* /bin/javac
* /bin/javadoc
* /bin/javap
* /bin/jcmd
* /bin/jconsole
* /bin/jdb
* /bin/jdeprscan
* /bin/jdeps
* /bin/jfr
* /bin/jhsdb
* /bin/jimage
* /bin/jinfo
* /bin/jjs
* /bin/jlink
* /bin/jmap
* /bin/jmod
* /bin/jps
* /bin/jrunscript
* /bin/jshell
* /bin/jstack
* /bin/jstat
* /bin/jstatd
* /bin/keytool
* /bin/pack200
* /bin/rmic
* /bin/rmid
* /bin/rmiregistry
* /bin/serialver
* /bin/unpack200

#### Using an example binary

You can now use the binary as normal. For example:

``/bin/java --version`` or ``java --version``

```bash
$ java --version
openjdk 11.0.11 2021-04-20
OpenJDK Runtime Environment AdoptOpenJDK-11.0.11+9 (build 11.0.11+9)
OpenJDK 64-Bit Server VM AdoptOpenJDK-11.0.11+9 (build 11.0.11+9, mixed mode)
```
