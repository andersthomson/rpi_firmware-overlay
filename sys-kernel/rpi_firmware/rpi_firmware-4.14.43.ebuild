#Copyright Anders Thomson
EAPI=6

COMMIT="784fe6cebd9e5726c0c7b9e449f7cdbf2cf6959d"
DESCRIPTION="Raspberry Pi kernel, modules and GPU firmware binaries"
SRC_URI="https://github.com/raspberrypi/firmware/archive/${COMMIT}.zip -> ${P}.zip"

LICENSE="multiple"
SLOT="${PV}"
KEYWORDS=""
S="${WORKDIR}/firmware-${COMMIT}"

src_install() {
        mkdir -p "${ED}/lib/modules/"
        cp -r ${S}/modules/* "${ED}/lib/modules/"
        tar cvfz "${ED}/lib/modules/boot-${PV}.tar.gz" "${S}/boot/"*
}

