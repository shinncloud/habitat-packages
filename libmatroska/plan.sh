pkg_name="libmatroska"
pkg_origin="shinncloud"
pkg_version="1.5.2"
pkg_maintainer="Andy Shinn <andys@andyshinn.as>"
pkg_license=("Apache-2.0")
pkg_source="https://dl.matroska.org/downloads/${pkg_name}/${pkg_name}-${pkg_version}.tar.xz"
pkg_shasum="0ac6debfbf781d47f001b830aaf9be9dfbcefd13bcfb80ca5efc1c04b4a3c962"
pkg_deps=(core/glibc)
pkg_build_deps=(core/cmake core/make core/gcc shinncloud/libebml/1.3.9/20200422024840)
pkg_lib_dirs=(lib64)
pkg_include_dirs=(include)
pkg_pconfig_dirs=(lib64/pkgconfig)

do_prepare() {
  mkdir -p "${CACHE_PATH}/build"
}

do_build() {
  pushd "${CACHE_PATH}/build"
  cmake -DEBML_DIR="$(pkg_path_for libebml)/lib64/cmake/EBML" -DCMAKE_INSTALL_PREFIX=${pkg_prefix} "$CACHE_PATH"
  make
  popd
}

do_install() {
  pushd "${CACHE_PATH}/build"
  make install
  make
}
