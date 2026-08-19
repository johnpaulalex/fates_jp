set(pfunit_sources test_FatesHydroWTF.pf)

add_pfunit_ctest(FatesHydroWTF
  TEST_SOURCES "${pfunit_sources}"
  LINK_LIBRARIES fates csm_share)
