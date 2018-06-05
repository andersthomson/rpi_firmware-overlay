#Copyright Anders Thomson
EAPI=6

DESCRIPTION="Raspberry Pi kernel, modules and GPU firmware binaries"
SRC_URI="https://github.com/raspberrypi/firmware/archive/ab802d365130f21f6897c7e1bc2f432d87803337.zip -> .zip"

LICENSE="unknown"
SLOT=""
KEYWORDS=""
S="/firmware-ab802d365130f21f6897c7e1bc2f432d87803337"

src_install() {
        mkdir -p "/lib/modules/"
        cp -r /modules/* "/lib/modules/"
        tar cvfz "/lib/modules/boot-.tar.gz" "/boot/"*
}

