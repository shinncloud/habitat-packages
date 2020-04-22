pkg_name="libvorbis"
pkg_origin="shinncloud"
pkg_version="1.3.6"
pkg_maintainer="Andy Shinn <andys@andyshinn.as>"
pkg_license=("Apache-2.0")
pkg_source="https://ftp.osuosl.org/pub/xiph/releases/vorbis/${pkg_name}-${pkg_version}.tar.xz"
pkg_shasum="af00bb5a784e7c9e69f56823de4637c350643deedaf333d0fa86ecdba6fcb415"
pkg_deps=(core/glibc)
pkg_build_deps=(core/make core/gcc core/pkg-config fifthecho/libogg)
pkg_lib_dirs=(lib)
pkg_include_dirs=(include)
pkg_pconfig_dirs=(lib/pkgconfig)
