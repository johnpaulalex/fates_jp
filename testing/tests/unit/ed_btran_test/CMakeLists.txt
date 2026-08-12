set(pfunit_sources test_EDBtran.pf)

add_pfunit_ctest(EDBtran
  TEST_SOURCES "${pfunit_sources}"
  LINK_LIBRARIES fates csm_share)
