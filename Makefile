# $OpenBSD: Makefile,v 1.20 2012/09/25 20:54:39 brad Exp $

COMMENT=	VPN daemon
VERSION=	2.15
DISTNAME=	chaosvpn-${VERSION}
REVISION=	0
CATEGORIES=    	net

HOMEPAGE=	http://github.com/ryd/chaosvpn

MAINTAINER=	Gregor Best <gbe @ ring0 . de>

# MIT'ish
PERMIT_PACKAGE_FTP=	Yes
PERMIT_DISTFILES_CDROM=	Yes
PERMIT_DISTFILES_FTP=	Yes

# WANTLIB=	c m pthread stdc++
WANTLIB=	c ssl
RUN_DEPENDS= net/tinc

DISTFILES= v${VERSION}.tar.gz
MASTER_SITES=	${HOMEPAGE}/archive/

# CONFIGURE_STYLE=gnu

USE_GMAKE=yes

do-install:
	${INSTALL_PROGRAM} ${WRKBUILD}/chaosvpn ${PREFIX}/sbin
	${INSTALL_DATA} ${WRKSRC}/man/chaosvpn.1 ${PREFIX}/man/man1
	${INSTALL_DATA} ${WRKSRC}/man/chaosvpn.conf.5 ${PREFIX}/man/man5
	${INSTALL_DATA_DIR} ${PREFIX}/share/examples/chaosvpn
	${INSTALL_DATA} ${WRKSRC}/chaosvpn.conf.freebsd ${PREFIX}/share/examples/chaosvpn/chaosvpn.conf

.include <bsd.port.mk>
