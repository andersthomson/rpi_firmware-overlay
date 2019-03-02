#Copyright Anders Thomson
EAPI=6
IUSE="rpi1 rpi2"

COMMIT="f84820ed7fcfd0f0d364e3d47cdbc83215596b2c"
DESCRIPTION="Raspberry Pi kernel, modules and GPU firmware binaries"
SRC_URI="https://github.com/raspberrypi/firmware/archive/${COMMIT}.zip -> ${P}.zip"

LICENSE="multiple"
SLOT="4.19.25"
KEYWORDS="arm"
S="${WORKDIR}/firmware-${COMMIT}"

src_install() {
	echo "CONFIG_PROTECT_MASK=/lib/modules/${PV}/" > ${T}/99-${PN}
	doenvd ${T}/99-${PN}

        mkdir -p "${ED}/lib/modules/"
	if use rpi1 ; then
		cp -r "${S}/modules/4.19.25+" "${ED}/lib/modules/"
	fi
	if use rpi2 ; then
        	cp -r "${S}/modules/4.19.25-v7+" "${ED}/lib/modules/"
	fi
        tar cvfz "${ED}/lib/modules/4.19.25-v7+/boot-${PV}.tar.gz" -C "${S}" boot/
}

