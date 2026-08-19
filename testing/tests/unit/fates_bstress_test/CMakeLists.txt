set(pfunit_sources test_FatesBstress.pf)

add_pfunit_ctest(FatesBstress
  TEST_SOURCES "${pfunit_sources}"
  LINK_LIBRARIES fates csm_share)
