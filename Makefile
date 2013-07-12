# $OpenBSD$

COMMENT =	configuration manager for the tinc VPN daemon
VERSION =	2.17
DISTNAME =	chaosvpn-${VERSION}
REVISION =	0
CATEGORIES =	net

HOMEPAGE =	https://github.com/ryd/chaosvpn

MAINTAINER =	Gregor Best <gbe@ring0.de>

# BSD
PERMIT_PACKAGE_CDROM =	Yes
PERMIT_PACKAGE_FTP =		Yes
PERMIT_DISTFILES_FTP =	Yes

WANTLIB=	c crypto z
RUN_DEPENDS= net/tinc

DISTFILES= v${VERSION}.tar.gz
MASTER_SITES=	${HOMEPAGE}/archive/

USE_GMAKE=	yes
NO_TEST=	yes

do-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/chaosvpn ${PREFIX}/sbin
	${INSTALL_DATA} ${WRKSRC}/man/chaosvpn.1 ${PREFIX}/man/man1
	${INSTALL_DATA} ${WRKSRC}/man/chaosvpn.conf.5 ${PREFIX}/man/man5
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/chaosvpn
	${INSTALL_DATA} ${FILESDIR}/chaosvpn.conf ${PREFIX}/share/examples/chaosvpn/chaosvpn.conf

.include <bsd.port.mk>
