# Makefile
# $Header: /home/cjm/cvs/config/Makefile,v 1.7 2005-11-29 18:50:09 cjm Exp $ 
include	../Makefile.common

CONFIG_DIR	=config
BINDIR 		= $(LT_BIN_HOME)/$(CONFIG_DIR)

CONFIG_SRCS	= current5.filter.properties current.filter.properties \
	day_calibrate_state.properties twilight_calibrate_state.properties \
	fartcam.current.filter.properties fartcam.filter.properties \
	dillcamsouth.current.filter.properties dillcamsouth.filter.properties \
	filter.properties \
	filters_lt_rat_CURRENT.properties filters_lt_rat_DB.properties \
	ftccd1.day_calibrate_state.properties ftccd1.twilight_calibrate_state.properties \
	ftccd2.day_calibrate_state.properties ftccd2.twilight_calibrate_state.properties \
	ltccd2.day_calibrate_state.properties ltccd2.twilight_calibrate_state.properties \
	ltccd3.day_calibrate_state.properties ltccd3.twilight_calibrate_state.properties \
	nuview.current.filter.properties \
	ratcam.current.filter.properties ratcam.filter.properties \
	supircam1.day_calibrate_state.properties supircam1.twilight_calibrate_state.properties \
	supircam2.day_calibrate_state.properties supircam2.twilight_calibrate_state.properties \
	supircam.current.filter.properties supircam.filter.properties \
	ftspec1.day_calibrate_state.properties ftspec1.twilight_calibrate_state.properties \
	spectrograph.day_calibrate_state.properties spectrograph.twilight_calibrate_state.properties \
	nuview1.day_calibrate_state.properties nuview1.twilight_calibrate_state.properties \
	ratcam1.day_calibrate_state.properties ratcam1.twilight_calibrate_state.properties
CONFIG_OBJS	= $(CONFIG_SRCS:%.properties=$(BINDIR)/%.properties)

top: config

config: $(CONFIG_OBJS)

$(BINDIR)/%.properties: %.properties
	$(CP) -f $< $@

checkout:
	$(CO) $(CO_OPTIONS) $(CONFIG_SRCS)

checkin:
	-$(CI) $(CI_OPTIONS) $(CONFIG_SRCS)

clean: tidy
	-$(RM) $(RM_OPTIONS) $(CONFIG_OBJS)

tidy:
	-$(RM) $(RM_OPTIONS) $(TIDY_OPTIONS)

backup: tidy
	tar cvf $(BACKUP_DIR)/config.tar .
	compress $(BACKUP_DIR)/config.tar
#
# $Log: not supported by cvs2svn $
# Revision 1.6  2004/11/22 12:23:50  cjm
# Added force option to cp to enable copy of checked in configs.
#
# Revision 1.5  2004/10/13 20:01:45  cjm
# Added supircam2.
#
# Revision 1.4  2004/08/06 13:27:52  cjm
# Added backup target.
#
# Revision 1.3  2004/07/06 18:15:48  cjm
# Added nuview1 files.
#
# Revision 1.2  2004/05/24 18:28:21  cjm
# Added ftccd2/dillcamsouth.
#
# Revision 1.1  2004/04/19 14:09:02  cjm
# Initial revision
#
#
