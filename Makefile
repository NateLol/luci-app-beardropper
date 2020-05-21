include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-beardropper
PKG_VERSION:=1
PKG_RELEASE:=1


include $(INCLUDE_DIR)/package.mk



define Package/$(PKG_NAME)
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI support for bearDropper
	PKGARCH:=all
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/conffiles
	/etc/config/bearDropper
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/init.d $(1)/usr/sbin $(1)/etc/config $(1)/usr/lib/lua/luci $(1)/etc/uci-defaults $(1)/usr/lib/lua/luci/i18n
	$(CP) ./luasrc/* $(1)/usr/lib/lua/luci
	$(INSTALL_CONF) ./root/etc/config/bearDropper $(1)/etc/config
	$(INSTALL_BIN) ./root/etc/init.d/bearDropper $(1)/etc/init.d
	$(INSTALL_BIN) ./root/usr/sbin/bearDropper $(1)/usr/sbin
	$(INSTALL_DATA) ./po/zh_Hans/bearDropper.zh-cn.lmo $(1)/usr/lib/lua/luci/i18n
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
