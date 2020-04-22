pkg_name="mkvtoolnix"
pkg_origin="shinncloud"
pkg_version="45.0.0"
pkg_maintainer="Andy Shinn <andys@andyshinn.as>"
pkg_license=("Apache-2.0")
pkg_source="https://${pkg_name}.download/sources/${pkg_name}-${pkg_version}.tar.xz"
pkg_shasum="995208f38e5d77da326ec2718a820357219856d8e375081e5d8d7ab9239b6d66"
pkg_deps=(core/glibc)

pkg_build_deps=(
  core/make
  core/gcc
  core/pkg-config
  core/boost
  core/zlib
  core/ruby
  fifthecho/libogg
  core/libxslt
  shinncloud/libvorbis/1.3.6/20200422032826
  shinncloud/libmatroska/1.5.2/20200422030329
  shinncloud/libebml/1.3.9/20200422024840
  shinncloud/docbook-xsl/1.79.1/20200422035311
)

pkg_bin_dirs=(bin)

do_build() {
  ./configure \
    --prefix="$pkg_prefix" \
    --with-boost="$(pkg_path_for boost)" \
    --with-docbook-xsl-root="$(pkg_path_for docbook-xsl)/share/xml/docbook/xsl-stylesheets"
  rake
}

do_install() {
  rake install
}
