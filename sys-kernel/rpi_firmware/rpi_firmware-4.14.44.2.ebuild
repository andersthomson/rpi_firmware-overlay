#Copyright Anders Thomson
EAPI=6

inherit git-r3

DESCRIPTION="Raspberry Pi kernel, modules and GPU firmware binaries"
EGIT_REPO_URI="https://github.com/raspberrypi/firmware.git"
EGIT_COMMIT="ab802d365130f21f6897c7e1bc2f432d87803337"

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

