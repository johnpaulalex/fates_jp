module EDPftvarconMockMod

  use FatesConstantsMod, only: r8 => fates_r8
  use EDPftvarcon, only: EDPftvarcon_inst
  use FatesHydraulicsMemMod, only : n_plant_media

  implicit none

contains

  subroutine init_mock_edpftvarcon()
    integer :: max_pft = 1
    integer :: num_hydrorgan

    num_hydrorgan = n_plant_media 

    if (.not. allocated(EDPftvarcon_inst%hydr_p_taper)) then
       ! 1D arrays
       allocate(EDPftvarcon_inst%hydr_p_taper(max_pft))
       allocate(EDPftvarcon_inst%hydr_rs2(max_pft))
       allocate(EDPftvarcon_inst%hydr_srl(max_pft))
       allocate(EDPftvarcon_inst%hydr_rfrac_stem(max_pft))
       allocate(EDPftvarcon_inst%hydr_avuln_gs(max_pft))
       allocate(EDPftvarcon_inst%hydr_p50_gs(max_pft))
       allocate(EDPftvarcon_inst%hydr_k_lwp(max_pft))
       
       allocate(EDPftvarcon_inst%damage_frac(max_pft))
       allocate(EDPftvarcon_inst%vcmax25top(max_pft, 1))
       
       ! 2D arrays
       allocate(EDPftvarcon_inst%hydr_vg_alpha_node(max_pft,num_hydrorgan))
       allocate(EDPftvarcon_inst%hydr_vg_m_node(max_pft,num_hydrorgan))
       allocate(EDPftvarcon_inst%hydr_vg_n_node(max_pft,num_hydrorgan))
       allocate(EDPftvarcon_inst%hydr_avuln_node(max_pft,num_hydrorgan))
       allocate(EDPftvarcon_inst%hydr_p50_node(max_pft,num_hydrorgan))
       allocate(EDPftvarcon_inst%hydr_epsil_node(max_pft,num_hydrorgan))
       allocate(EDPftvarcon_inst%hydr_pitlp_node(max_pft,num_hydrorgan))
       allocate(EDPftvarcon_inst%hydr_fcap_node(max_pft,num_hydrorgan))
       allocate(EDPftvarcon_inst%hydr_pinot_node(max_pft,num_hydrorgan))
       allocate(EDPftvarcon_inst%hydr_kmax_node(max_pft,num_hydrorgan))
       allocate(EDPftvarcon_inst%hydr_resid_node(max_pft,num_hydrorgan))
       allocate(EDPftvarcon_inst%hydr_thetas_node(max_pft,num_hydrorgan))
    end if

    ! Xylem tapering exponent p_taper = 0.5 represents ideal power-law conduit tapering along trunk length
    EDPftvarcon_inst%hydr_p_taper(:) = 0.5_r8
    ! Fine root radius rs2 = 0.001 m = 1 mm represents standard fine absorbing root radius
    EDPftvarcon_inst%hydr_rs2(:) = 0.001_r8
    ! Specific root length srl = 10.0 m/g represents standard root absorptive length per unit carbon mass
    EDPftvarcon_inst%hydr_srl(:) = 10.0_r8
    ! Stem resistance fraction rfrac_stem = 0.5 splits stem hydraulic resistance equally between upper and lower segments
    EDPftvarcon_inst%hydr_rfrac_stem(:) = 0.5_r8
    ! Stomatal vulnerability exponent avuln_gs = 2.0 provides sigmoidal stomatal closure curve
    EDPftvarcon_inst%hydr_avuln_gs(:) = 2.0_r8
    ! Stomatal 50% closure potential p50_gs = -2.0 MPa sets stomatal sensitivity threshold to match xylem p50
    EDPftvarcon_inst%hydr_p50_gs(:) = -2.0_r8
    ! Leaf water potential scaling factor k_lwp = 1.0 provides unit scaling for stomatal conductance response
    EDPftvarcon_inst%hydr_k_lwp(:) = 1.0_r8
    
    ! Crown damage fraction default = 0.1 represents 10% baseline background canopy crown loss
    EDPftvarcon_inst%damage_frac(:) = 0.1_r8
    ! Top-of-canopy Vcmax25 default = 50.0 umol/m2/s represents baseline photosynthetic capacity for C3 trees
    EDPftvarcon_inst%vcmax25top(:,:) = 50.0_r8

    ! van Genuchten alpha = 0.01 1/mm sets air-entry pressure inverse length scale
    EDPftvarcon_inst%hydr_vg_alpha_node(:,:) = 0.01_r8
    ! van Genuchten m parameter = 0.5 (m = 1 - 1/n for n=2.0)
    EDPftvarcon_inst%hydr_vg_m_node(:,:) = 0.5_r8
    ! van Genuchten n parameter = 2.0 sets pore-size distribution index
    EDPftvarcon_inst%hydr_vg_n_node(:,:) = 2.0_r8
    ! Vulnerability curve exponent avuln = 2.0 sets sigmoidal slope of xylem cavitation curve
    EDPftvarcon_inst%hydr_avuln_node(:,:) = 2.0_r8
    ! Xylem 50% loss water potential p50 = -2.0 MPa represents typical temperate tree cavitation resistance
    EDPftvarcon_inst%hydr_p50_node(:,:) = -2.0_r8
    ! Elastic modulus epsil = 10.0 MPa represents typical cell wall elasticity of woody tissues
    EDPftvarcon_inst%hydr_epsil_node(:,:) = 10.0_r8
    ! Turgor loss point pitlp = -1.5 MPa sets osmotic wilting potential threshold
    EDPftvarcon_inst%hydr_pitlp_node(:,:) = -1.5_r8
    ! Capillary fraction fcap = 0.1 sets 10% baseline elastic capillary storage volume
    EDPftvarcon_inst%hydr_fcap_node(:,:) = 0.1_r8
    ! Full turgor osmotic potential pinot = -1.0 MPa sets baseline solute potential at full hydration
    EDPftvarcon_inst%hydr_pinot_node(:,:) = -1.0_r8
    ! Maximum tissue hydraulic conductivity kmax = 1.0 kg/m/s/MPa normalizes intrinsic tissue permeability
    EDPftvarcon_inst%hydr_kmax_node(:,:) = 1.0_r8
    ! Residual relative water content resid = 0.05 m3/m3 (5% non-extractable bound water)
    EDPftvarcon_inst%hydr_resid_node(:,:) = 0.05_r8
    ! Saturated relative water content thetas = 0.5 m3/m3 (50% tissue porosity)
    EDPftvarcon_inst%hydr_thetas_node(:,:) = 0.5_r8



  end subroutine init_mock_edpftvarcon

end module EDPftvarconMockMod
