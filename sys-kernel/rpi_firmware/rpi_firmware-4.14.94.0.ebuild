#Copyright Anders Thomson
EAPI=6
IUSE="rpi1 rpi2"

COMMIT="81cca1a9380c828299e884dba5efd0d4acb39e8d"
DESCRIPTION="Raspberry Pi kernel, modules and GPU firmware binaries"
SRC_URI="https://github.com/raspberrypi/firmware/archive/${COMMIT}.zip -> ${P}.zip"

LICENSE="multiple"
SLOT="4.14.94"
KEYWORDS="arm"
S="${WORKDIR}/firmware-${COMMIT}"

src_install() {
        mkdir -p "${ED}/lib/modules/"
	if use rpi1 ; then
		cp -r "${S}/modules/4.14.94+" "${ED}/lib/modules/"
	fi
	if use rpi2 ; then
        	cp -r "${S}/modules/4.14.94-v7+" "${ED}/lib/modules/"
	fi
        tar cvfz "${ED}/lib/modules/boot-${PV}.tar.gz" -C "${S}" boot/
}

