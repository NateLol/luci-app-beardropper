#
# Copyright (C) 2020 Nate Ding
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

LUCI_Title:=LuCI Support for BearDropper
LUCI_DEPENDS:=
LUCI_PKGARCH=all

PKG_MAINTANINER:=Nate Ding <natelol@github.com>
PKG_LICENSE:=GLPv3.0

include ../../luci.mk

