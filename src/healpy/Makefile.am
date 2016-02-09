

EXTRA_DIST = \
healpy \
CHANGELOG.rst \
CITATION \
COPYING \
INSTALL.rst \
MANIFEST.in \
PKG-INFO \
setup.cfg.in \
setup.py.in

noinst_SCRIPTS = setup.py gen_setup.sh

CLEANFILES = setup.py setup.cfg


setup.py : $(srcdir)/setup.py.in $(srcdir)/setup.cfg.in $(srcdir)/gen_setup.sh
	@cdir=`echo $(CFITSIO_DIR)`; \
	$(srcdir)/gen_setup.sh "$(prefix)" "$(libdir)" "$${cdir}"


# Actually run the setup.py script, at "make install" time

install-exec-hook :
	@$(PYTHON) setup.py install

clean-local :
	rm -rf build dist healpy.egg-info

