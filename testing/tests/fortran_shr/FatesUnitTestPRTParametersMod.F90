module FatesUnitTestPRTParametersMod

  use FatesConstantsMod, only: r8 => fates_r8
  use FatesInterfaceTypesMod, only: numpft, hlm_use_planthydro, nleafage
  use EDParamsMod, only: hydr_htftype_node
  use PRTParametersMod, only: prt_params
  use FatesParameterDerivedMod, only : param_derived
  use EDPftvarconMockMod, only: init_mock_edpftvarcon

  implicit none

contains

  subroutine init_mock_prt_params()
    integer :: npft, max_pft
    npft = 1
    max_pft = 1
    
    numpft = npft
    hlm_use_planthydro = 1
    nleafage = 1
    
    if (.not. allocated(hydr_htftype_node)) then
      allocate(hydr_htftype_node(4))
      hydr_htftype_node(:) = 2
    end if
    
    if (.not. allocated(prt_params%phen_leaf_habit)) then
      allocate(prt_params%phen_leaf_habit(npft))
      allocate(prt_params%phen_fnrt_drop_fraction(npft))
      allocate(prt_params%phen_stem_drop_fraction(npft))
      allocate(prt_params%phen_drought_threshold(npft))
      allocate(prt_params%phen_moist_threshold(npft))
      allocate(prt_params%phen_doff_time(npft))
      allocate(prt_params%senleaf_long_fdrought(max_pft))
      allocate(prt_params%leaf_long(max_pft, max_pft))
      allocate(prt_params%leaf_long_ustory(max_pft, max_pft))
      allocate(prt_params%root_long(max_pft))
      allocate(prt_params%branch_long(max_pft))
      allocate(prt_params%turnover_nitr_retrans(max_pft, max_pft))
      allocate(prt_params%turnover_phos_retrans(max_pft, max_pft))
      allocate(prt_params%leafn_vert_scaler_coeff1(max_pft))
      allocate(prt_params%leafn_vert_scaler_coeff2(max_pft))
      allocate(prt_params%grperc(max_pft))
      allocate(prt_params%nitr_stoich_p1(max_pft, max_pft))
      allocate(prt_params%phos_stoich_p1(max_pft, max_pft))
      allocate(prt_params%nitr_store_ratio(max_pft))
      allocate(prt_params%phos_store_ratio(max_pft))
      allocate(prt_params%organ_id(max_pft))
      allocate(prt_params%alloc_priority(max_pft, max_pft))
      allocate(prt_params%cushion(max_pft))
      allocate(prt_params%leaf_stor_priority(max_pft))
      allocate(prt_params%dbh_repro_threshold(max_pft))
      allocate(prt_params%seed_alloc_mature(max_pft))
      allocate(prt_params%seed_alloc(max_pft))
      allocate(prt_params%repro_alloc_a(max_pft))
      allocate(prt_params%repro_alloc_b(max_pft))
      allocate(prt_params%organ_param_id(max_pft))
      allocate(prt_params%fnrt_prof_mode(max_pft))
      allocate(prt_params%fnrt_prof_a(max_pft))
      allocate(prt_params%fnrt_prof_b(max_pft))
      allocate(prt_params%c2b(max_pft))
      allocate(prt_params%wood_density(max_pft))
      allocate(prt_params%woody(max_pft))
      allocate(prt_params%slamax(max_pft))
      allocate(prt_params%slatop(max_pft))
      allocate(prt_params%allom_sai_scaler(max_pft))
      allocate(prt_params%allom_dbh_maxheight(max_pft))
      allocate(prt_params%allom_hmode(max_pft))
      allocate(prt_params%allom_lmode(max_pft))
      allocate(prt_params%allom_fmode(max_pft))
      allocate(prt_params%allom_amode(max_pft))
      allocate(prt_params%allom_cmode(max_pft))
      allocate(prt_params%allom_smode(max_pft))
      allocate(prt_params%allom_stmode(max_pft))
      allocate(prt_params%allom_dmode(max_pft))
      allocate(prt_params%allom_la_per_sa_int(max_pft))
      allocate(prt_params%allom_la_per_sa_slp(max_pft))
      allocate(prt_params%allom_l2fr(max_pft))
      allocate(prt_params%allom_agb_frac(max_pft))
      allocate(prt_params%allom_d2h1(max_pft))
      allocate(prt_params%allom_d2h2(max_pft))
      allocate(prt_params%allom_d2h3(max_pft))
      allocate(prt_params%allom_d2bl1(max_pft))
      allocate(prt_params%allom_d2bl2(max_pft))
      allocate(prt_params%allom_d2bl3(max_pft))
      allocate(prt_params%allom_blca_expnt_diff(max_pft))
      allocate(prt_params%allom_d2ca_coefficient_max(max_pft))
      allocate(prt_params%allom_d2ca_coefficient_min(max_pft))
      allocate(prt_params%allom_agb1(max_pft))
      allocate(prt_params%allom_agb2(max_pft))
      allocate(prt_params%allom_agb3(max_pft))
      allocate(prt_params%allom_agb4(max_pft))
      allocate(prt_params%allom_h2cd1(max_pft))
      allocate(prt_params%allom_h2cd2(max_pft))
      allocate(prt_params%allom_zroot_max_dbh(max_pft))
      allocate(prt_params%allom_zroot_max_z(max_pft))
      allocate(prt_params%allom_zroot_min_dbh(max_pft))
      allocate(prt_params%allom_zroot_min_z(max_pft))
      allocate(prt_params%allom_zroot_k(max_pft))
      allocate(prt_params%pid_kp(max_pft))
      allocate(prt_params%pid_ki(max_pft))
      allocate(prt_params%pid_kd(max_pft))
      allocate(prt_params%store_ovrflw_frac(max_pft))
      allocate(prt_params%nfix_mresp_scfrac(max_pft))
    end if
      ! Phenology leaf habit default (1 = evergreen)
      prt_params%phen_leaf_habit = 1
      ! Fine root drop fraction (1.0 = 100% loss upon senescence)
      prt_params%phen_fnrt_drop_fraction = 1.0_r8
      ! Stem drop fraction (1.0 = 100% loss upon senescence)
      prt_params%phen_stem_drop_fraction = 1.0_r8
      ! Drought phenology threshold (1.0)
      prt_params%phen_drought_threshold = 1.0_r8
      ! Moisture threshold (1.0)
      prt_params%phen_moist_threshold = 1.0_r8
      ! Day off time default (1.0 day)
      prt_params%phen_doff_time = 1.0_r8
      ! Leaf drought senescence multiplier (1.0)
      prt_params%senleaf_long_fdrought = 1.0_r8
      ! Canopy leaf longevity (1.0 year)
      prt_params%leaf_long = 1.0_r8
      ! Understory leaf longevity (1.0 year)
      prt_params%leaf_long_ustory = 1.0_r8
      ! Fine root longevity (1.0 year)
      prt_params%root_long = 1.0_r8
      ! Branch longevity (1.0 year)
      prt_params%branch_long = 1.0_r8
      ! Nitrogen retranslocation fraction (1.0)
      prt_params%turnover_nitr_retrans = 1.0_r8
      ! Phosphorus retranslocation fraction (1.0)
      prt_params%turnover_phos_retrans = 1.0_r8
      ! Vertical leaf N scaler coefficient 1 (1.0)
      prt_params%leafn_vert_scaler_coeff1 = 1.0_r8
      ! Vertical leaf N scaler coefficient 2 (1.0)
      prt_params%leafn_vert_scaler_coeff2 = 1.0_r8
      ! Growth respiration percentage (1.0)
      prt_params%grperc = 1.0_r8
      ! Nitrogen stoichiometry parameter 1 (1.0)
      prt_params%nitr_stoich_p1 = 1.0_r8
      ! Phosphorus stoichiometry parameter 1 (1.0)
      prt_params%phos_stoich_p1 = 1.0_r8
      ! Nitrogen storage ratio (1.0)
      prt_params%nitr_store_ratio = 1.0_r8
      ! Phosphorus storage ratio (1.0)
      prt_params%phos_store_ratio = 1.0_r8
      ! Organ ID default (1)
      prt_params%organ_id = 1
      ! Allocation priority default (1)
      prt_params%alloc_priority = 1
      ! Allocation cushion default (1.0)
      prt_params%cushion = 1.0_r8
      ! Leaf storage priority (1.0)
      prt_params%leaf_stor_priority = 1.0_r8
      ! DBH reproduction threshold (1.0 cm)
      prt_params%dbh_repro_threshold = 1.0_r8
      ! Mature seed allocation fraction (1.0)
      prt_params%seed_alloc_mature = 1.0_r8
      ! Seed allocation fraction (1.0)
      prt_params%seed_alloc = 1.0_r8
      ! Reproduction allocation parameter a (1.0)
      prt_params%repro_alloc_a = 1.0_r8
      ! Reproduction allocation parameter b (1.0)
      prt_params%repro_alloc_b = 1.0_r8
      ! Organ parameter ID default (1)
      prt_params%organ_param_id = 1
      ! Fine root distribution profile mode (1.0 = Zeng 2001 profile)
      prt_params%fnrt_prof_mode = 1.0_r8
      ! Zeng 2001 root profile parameter a (7.0 m-1)
      prt_params%fnrt_prof_a = 7.0_r8
      ! Zeng 2001 root profile parameter b (2.0 m-1)
      prt_params%fnrt_prof_b = 2.0_r8
      ! Carbon to biomass conversion factor (2.0 gBiomass/gC)
      prt_params%c2b = 2.0_r8
      ! Wood density (0.5 g/cm3)
      prt_params%wood_density = 0.5_r8
      ! Woody PFT flag (1 = woody)
      prt_params%woody = 1
      ! Maximum SLA (0.02 m2/g)
      prt_params%slamax = 0.02_r8
      ! Top of canopy SLA (0.015 m2/g)
      prt_params%slatop = 0.015_r8
      ! SAI scaler (1.0)
      prt_params%allom_sai_scaler = 1.0_r8
      ! Max height DBH (1.0 m)
      prt_params%allom_dbh_maxheight = 1.0_r8
      ! Allometry height mode (1)
      prt_params%allom_hmode = 1
      ! Allometry leaf mode (1)
      prt_params%allom_lmode = 1
      ! Allometry fine root mode (1)
      prt_params%allom_fmode = 1
      ! Allometry sapwood mode (1)
      prt_params%allom_amode = 1
      ! Allometry crown mode (1)
      prt_params%allom_cmode = 1
      ! Allometry structure mode (1)
      prt_params%allom_smode = 1
      ! Allometry storage mode (1)
      prt_params%allom_stmode = 1
      ! Allometry damage mode (1)
      prt_params%allom_dmode = 1
      ! Leaf area per sapwood area intercept (1.0 m2/cm2)
      prt_params%allom_la_per_sa_int = 1.0_r8
      ! Leaf area per sapwood area slope (1.0 m2/cm2/m)
      prt_params%allom_la_per_sa_slp = 1.0_r8
      ! Leaf to fine root ratio (1.0)
      prt_params%allom_l2fr = 1.0_r8
      ! Aboveground biomass fraction (0.6 = 60% above ground, 40% below ground)
      prt_params%allom_agb_frac = 0.6_r8
      ! Height allometry d2h1 (1.0)
      prt_params%allom_d2h1 = 1.0_r8
      ! Height allometry d2h2 (1.0)
      prt_params%allom_d2h2 = 1.0_r8
      ! Height allometry d2h3 (1.0)
      prt_params%allom_d2h3 = 1.0_r8
      ! Leaf biomass allometry coefficient 1 (0.1)
      prt_params%allom_d2bl1 = 0.1_r8
      ! Leaf biomass allometry coefficient 2 (1.0)
      prt_params%allom_d2bl2 = 1.0_r8
      ! Leaf biomass allometry coefficient 3 (1.0)
      prt_params%allom_d2bl3 = 1.0_r8
      ! Canopy exponent difference (1.0)
      prt_params%allom_blca_expnt_diff = 1.0_r8
      ! Max crown area coefficient (1.0)
      prt_params%allom_d2ca_coefficient_max = 1.0_r8
      ! Min crown area coefficient (1.0)
      prt_params%allom_d2ca_coefficient_min = 1.0_r8
      ! AGB allometry coefficient 1 (1.0)
      prt_params%allom_agb1 = 1.0_r8
      ! AGB allometry coefficient 2 (1.0)
      prt_params%allom_agb2 = 1.0_r8
      ! AGB allometry coefficient 3 (1.0)
      prt_params%allom_agb3 = 1.0_r8
      ! AGB allometry coefficient 4 (1.0)
      prt_params%allom_agb4 = 1.0_r8
      ! Height to crown depth coefficient 1 (1.0)
      prt_params%allom_h2cd1 = 1.0_r8
      ! Height to crown depth coefficient 2 (1.0)
      prt_params%allom_h2cd2 = 1.0_r8
      ! Maximum rooting depth DBH (100.0 cm)
      prt_params%allom_zroot_max_dbh = 100.0_r8
      ! Minimum rooting depth DBH (1.0 cm)
      prt_params%allom_zroot_min_dbh = 1.0_r8
      ! Maximum rooting depth (2.0 m)
      prt_params%allom_zroot_max_z = 2.0_r8
      ! Minimum rooting depth (0.5 m)
      prt_params%allom_zroot_min_z = 0.5_r8
      ! Rooting depth scaling exponent k (0.05)
      prt_params%allom_zroot_k = 0.05_r8
      ! PID controller P gain (1.0)
      prt_params%pid_kp = 1.0_r8
      ! PID controller I gain (1.0)
      prt_params%pid_ki = 1.0_r8
      ! PID controller D gain (1.0)
      prt_params%pid_kd = 1.0_r8
      ! Storage overflow fraction (1.0)
      prt_params%store_ovrflw_frac = 1.0_r8
      ! N-fixation respiration fraction (1.0)
      prt_params%nfix_mresp_scfrac = 1.0_r8
    ! Standard physical defaults for PFT PRT parameters (Jackson et al. 1996, Saldarriaga et al. 1988)
    prt_params%fnrt_prof_a = 7.0_r8            ! [1/m] Root profile depth decay coefficient
    prt_params%fnrt_prof_b = 2.0_r8            ! [dimensionless] Root profile shape exponent
    prt_params%c2b = 2.0_r8                    ! [g C / g biomass] Carbon-to-biomass conversion factor
    prt_params%slatop = 0.015_r8               ! [m2/g C] Top-of-canopy specific leaf area
    prt_params%wood_density = 0.5_r8           ! [g/cm3] Sapwood/heartwood density (temperate broadleaf default)
    prt_params%woody = 1                       ! Plant functional type flag (1 = woody tree, 0 = herbaceous)
    prt_params%allom_agb_frac = 0.6_r8         ! [dimensionless] Aboveground biomass fraction
    prt_params%allom_zroot_max_dbh = 100.0_r8 ! [cm] DBH cap for maximum rooting depth scaling
    prt_params%allom_zroot_min_dbh = 1.0_r8   ! [cm] Minimum DBH threshold for rooting depth scaling
    prt_params%allom_zroot_max_z = 2.0_r8     ! [m] Maximum rooting depth under unconstrained soil
    prt_params%allom_zroot_min_z = 0.5_r8     ! [m] Minimum rooting depth for saplings
    prt_params%allom_zroot_k = 0.05_r8        ! [1/cm] Rooting depth vs DBH exponential saturation rate
    prt_params%allom_d2bl1 = 0.1_r8            ! Allometric DBH-to-leaf biomass coefficient 1
    prt_params%allom_d2bl2 = 1.0_r8            ! Allometric DBH-to-leaf biomass exponent 2
    prt_params%allom_d2bl3 = 1.0_r8            ! Allometric DBH-to-leaf biomass scaling factor 3

    call init_mock_edpftvarcon()
    call param_derived%Init(npft)
  end subroutine init_mock_prt_params



end module FatesUnitTestPRTParametersMod
