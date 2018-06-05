#Copyright Anders Thomson
EAPI=6


DESCRIPTION="Raspberry Pi kernel, modules and GPU firmware binaries"
SRC_URI="https://github.com/raspberrypi/firmware/archive/ab802d365130f21f6897c7e1bc2f432d87803337.zip"

LICENSE="unknown"
SLOT="0"
KEYWORDS=""


src_install() {
        default

        newinitd ""/tvheadend.initd tvheadend
        newconfd ""/tvheadend.confd tvheadend

        use systemd &&
                systemd_dounit ""/tvheadend.service

        dodir /etc/tvheadend
        fperms 0700 /etc/tvheadend
        fowners tvheadend:video /etc/tvheadend
}

