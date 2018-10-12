#Copyright Anders Thomson
EAPI=6
IUSE="rpi1 rpi2"

COMMIT="fbad6408c4596d3d671736ee0571aae444f24e68"
DESCRIPTION="Raspberry Pi kernel, modules and GPU firmware binaries"
SRC_URI="https://github.com/raspberrypi/firmware/archive/${COMMIT}.zip -> ${P}.zip"

LICENSE="multiple"
SLOT="4.14.74"
KEYWORDS="arm"
S="${WORKDIR}/firmware-${COMMIT}"

src_install() {
        mkdir -p "${ED}/lib/modules/"
	if use rpi1 ; then
		cp -r "${S}/modules/4.14.74+" "${ED}/lib/modules/"
	fi
	if use rpi2 ; then
        	cp -r "${S}/modules/4.14.74-v7+" "${ED}/lib/modules/"
	fi
        tar cvfz "${ED}/lib/modules/boot-${PV}.tar.gz" -C "${S}" boot/
}

