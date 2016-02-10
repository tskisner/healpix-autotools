
EXTRA_DIST = \
README.txt \
HEALPix_startup \
gen_launch.sh \
hidl.in \
hidlde.in \
examples \
fits \
interfaces \
misc \
toolkit \
visu \
zzz_external


bin_SCRIPTS = hidl hidlde

CLEANFILES = hidl hidlde

idldir = $(datadir)/@PACKAGE@/idl

idl_DATA = \
HEALPix_startup


hidlde : hidl

hidl : $(srcdir)/hidl.in $(srcdir)/hidlde.in $(srcdir)/gen_launch.sh
	@$(srcdir)/gen_launch.sh "$(prefix)" "$(bindir)" "$(datadir)/@PACKAGE@" "$(srcdir)"


# install / uninstall all the IDL files

install-data-local:
	@$(mkinstalldirs) $(DESTDIR)$(datadir)/@PACKAGE@/idl; \
	cp -r $(srcdir)/examples $(DESTDIR)$(datadir)/@PACKAGE@/idl/; \
	cp -r $(srcdir)/fits $(DESTDIR)$(datadir)/@PACKAGE@/idl/; \
	cp -r $(srcdir)/interfaces $(DESTDIR)$(datadir)/@PACKAGE@/idl/; \
	cp -r $(srcdir)/misc $(DESTDIR)$(datadir)/@PACKAGE@/idl/; \
	cp -r $(srcdir)/toolkit $(DESTDIR)$(datadir)/@PACKAGE@/idl/; \
	cp -r $(srcdir)/visu $(DESTDIR)$(datadir)/@PACKAGE@/idl/; \
	cp -r $(srcdir)/zzz_external $(DESTDIR)$(datadir)/@PACKAGE@/idl/; \
	chmod -R a=rX,u+w $(DESTDIR)$(datadir)/@PACKAGE@/idl

uninstall-local:
	@rm -rf $(DESTDIR)$(datadir)/@PACKAGE@/idl

