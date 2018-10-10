#Copyright Anders Thomson
EAPI=6

COMMIT="fbad6408c4596d3d671736ee0571aae444f24e68"
DESCRIPTION="Raspberry Pi kernel, modules and GPU firmware binaries"
SRC_URI="https://github.com/raspberrypi/firmware/archive/${COMMIT}.zip -> ${P}.zip"

LICENSE="multiple"
SLOT=""
KEYWORDS=""
S="${WORKDIR}/firmware-${COMMIT}"

src_install() {
        mkdir -p "${ED}/lib/modules/"
        cp -r ${S}/modules/* "${ED}/lib/modules/"
        tar cvfz "${ED}/lib/modules/boot-${PV}.tar.gz" "${S}/boot/"*
}

