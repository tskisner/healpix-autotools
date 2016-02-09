#!/bin/sh

rm -f test*

../synfast/synfast syn.par && \
../map2gif/map2gif -inp test_map.fits -out test_map.gif -bar t -ttl 'CMB Map' && \
../smoothing/smoothing smo.par && \
../map2gif/map2gif -inp test_sm.fits -out test_sm.gif -bar t -ttl 'Smoothed CMB Map' && \
../ud_grade/ud_grade udg.par && \
../map2gif/map2gif -inp test_LOres.fits -out test_LOres.gif -bar t -ttl 'Degraded Map' && \
../hotspot/hotspot hot.par && \
../map2gif/map2gif -inp test_ext.fits -out test_ext.gif -bar t -ttl 'Extrema Only Map' && \
../anafast/anafast ana.par && \
../alteralm/alteralm alt.par && \
../median_filter/median_filter med.par && \
../map2gif/map2gif -inp test_mf.fits -out test_mf.gif -bar t -ttl 'Median Filtered Map' && \
../ngsims_full_sky/sky_ng_sim ngfs.par && \
../map2gif/map2gif -inp test_ngfs.fits -out test_ngfs.gif -bar t -ttl 'Non-Gaussian Map' && \
../process_mask/process_mask prmask.par && \
../map2gif/map2gif -inp test_distmask.fits -out test_distmask.gif -bar t -ttl 'Distance to mask border'

