#!/usr/bin/make

#-----------------------------------------------------------------------------

#DIALYZER_PLT = ~/.dialyzer_plt
DIALYZER_OPTS = --no_check_plt $(foreach D,$(DIALYZER_PLT),--plt $D)

#-----------------------------------------------------------------------------

.PHONY: all doc edoc compile build dialyzer

all: compile doc

doc edoc:
	rebar doc

compile build:
	rebar compile

dialyzer:
	dialyzer $(strip $(DIALYZER_OPTS)) --src src

#-----------------------------------------------------------------------------

#srpm: VERSION=$(shell awk '$$1 == "%define" && $$2 == "_version" {print $$3}' redhat/*.spec)
#srpm: PKGNAME=erlang-eni
#srpm:
#	rm -rf rpm-build
#	mkdir -p rpm-build/rpm/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
#	git archive --format=tar --prefix=$(PKGNAME)-$(VERSION)/ HEAD | gzip -9 > rpm-build/rpm/SOURCES/$(PKGNAME)-$(VERSION).tar.gz
#	rpmbuild --define="%_usrsrc $$PWD/rpm-build" --define="%_topdir %{_usrsrc}/rpm" -bs redhat/*.spec
#	mv rpm-build/rpm/SRPMS/$(PKGNAME)-*.src.rpm .
#	rm -r rpm-build

#-----------------------------------------------------------------------------
# vim:ft=make
