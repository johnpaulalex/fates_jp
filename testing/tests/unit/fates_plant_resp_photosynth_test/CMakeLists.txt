set(pfunit_sources test_FatesPlantRespPhotosynth.pf)

add_pfunit_ctest(FatesPlantRespPhotosynth
  TEST_SOURCES "${pfunit_sources}"
  LINK_LIBRARIES fates csm_share)
