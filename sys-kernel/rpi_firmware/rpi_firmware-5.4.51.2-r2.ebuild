#Copyright Anders Thomson
EAPI=6
IUSE="rpi1 rpi2"

COMMIT="1c7b2e3db97daf92934c3d64b939d90a0eb8d880"
DESCRIPTION="Raspberry Pi kernel, modules and GPU firmware binaries"
SRC_URI="https://github.com/raspberrypi/firmware/archive/${COMMIT}.zip -> ${P}.zip"

LICENSE="multiple"
SLOT="5.4.51"
KEYWORDS="arm"
S="${WORKDIR}/firmware-${COMMIT}"

src_install() {
        mkdir -p "${ED}/lib/modules/"
	if use rpi1 ; then
		cp -r "${S}/modules/5.4.51+" "${ED}/lib/modules/"
	fi
	if use rpi2 ; then
        	cp -r "${S}/modules/5.4.51-v7+" "${ED}/lib/modules/"
	fi
        tar cvfz "${ED}/lib/modules/5.4.51-v7+/boot-${PV}.tar.gz" -C "${S}" boot/
}

