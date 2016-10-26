

EXTRA_DIST = \
healpy \
CHANGELOG.rst \
CITATION \
COPYING \
INSTALL.rst \
MANIFEST.in \
README.rst \
requirements.txt \
setup.cfg.in \
setup.py.in

noinst_SCRIPTS = setup.py

dist_noinst_SCRIPTS = gen_setup.sh

CLEANFILES = setup.py setup.cfg


setup.py : $(srcdir)/setup.py.in $(srcdir)/setup.cfg.in $(srcdir)/gen_setup.sh
	@cdir=`echo $(CFITSIO_DIR)`; \
	$(srcdir)/gen_setup.sh "$(prefix)" "$(libdir)" "$${cdir}"


# Actually run the setup.py script, at "make install" time

install-exec-hook :
	@$(PYTHON_BIN) setup.py install

clean-local :
	rm -rf build dist healpy.egg-info

