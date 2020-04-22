pkg_name="libebml"
pkg_origin="shinncloud"
pkg_version="1.3.9"
pkg_maintainer="Andy Shinn <andys@andyshinn.as>"
pkg_license=("Apache-2.0")
pkg_source="https://dl.matroska.org/downloads/${pkg_name}/${pkg_name}-${pkg_version}.tar.xz"
pkg_shasum="c6b6c6cd8b20a46203cb5dce636883aef68beb2846f1e4103b660a7da2c9c548"
pkg_deps=(core/glibc)
pkg_build_deps=(core/cmake core/make core/gcc)
pkg_lib_dirs=(lib64)
pkg_include_dirs=(include)
pkg_pconfig_dirs=(lib64/pkgconfig)

do_prepare() {
  mkdir -p "${CACHE_PATH}/build"
}

do_build() {
  pushd "${CACHE_PATH}/build"
  cmake -DCMAKE_INSTALL_PREFIX=${pkg_prefix} "$CACHE_PATH"
  make
  popd
}

do_install() {
  pushd "${CACHE_PATH}/build"
  make install
  make
}
