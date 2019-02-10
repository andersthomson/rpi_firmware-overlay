#Copyright Anders Thomson
EAPI=6
IUSE="rpi1 rpi2"

COMMIT="ea3841a7f916895a98da5c5972cca68baff8aac3"
DESCRIPTION="Raspberry Pi kernel, modules and GPU firmware binaries"
SRC_URI="https://github.com/raspberrypi/firmware/archive/${COMMIT}.zip -> ${P}.zip"

LICENSE="multiple"
SLOT="4.14.97"
KEYWORDS="arm"
S="${WORKDIR}/firmware-${COMMIT}"

src_install() {
        mkdir -p "${ED}/lib/modules/"
	if use rpi1 ; then
		cp -r "${S}/modules/4.14.97+" "${ED}/lib/modules/"
	fi
	if use rpi2 ; then
        	cp -r "${S}/modules/4.14.97-v7+" "${ED}/lib/modules/"
	fi
        tar cvfz "${ED}/lib/modules/boot-${PV}.tar.gz" -C "${S}" boot/
}

