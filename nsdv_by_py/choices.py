def Indvdl_optns():
    name_slide="choose"
    show_f_l="Show formatting lish"
    show_s_l="Show subtitles list"
    down_t="Download Thumbnails"
    show_f_l_p="Show formatting list (playlist)"
    show_f_l_url_d="Show formatting list from url done"
    skip="Skip"

    lngth_ns = len(name_slide)
    lngth_sfl = len(show_f_l)
    lngth_ssl = len(show_s_l)
    lngth_dt = len(down_t)
    lngth_sflp = len(show_f_l_p)
    lngth_sfl_url_d = len(show_f_l_url_d)
    lngth_skp = len(skip)

    nmbr_spc_ns=37 - lngth_ns
    nmbr_spc_sfl=37 - lngth_sfl
    nmbr_spc_ssl=37 - lngth_ssl
    nmbr_spc_dt=37 - lngth_dt
    nmbr_spc_sflp=37 - lngth_sflp
    nmbr_spc_sfl_url_d=37 - lngth_sfl_url_d
    nmbr_spc_skp=37 - lngth_skp

    spc=" "
    dsh="-"
    nmbr_dsh=38
    #print ("+---+-----------------------------------------+")
    print (f"+---+",nmbr_dsh*dsh,"+")
    print (f"| \\ |",name_slide,nmbr_spc_ns*spc,"|")
    print (f"+---+",nmbr_dsh*dsh,"+")
    nmbr=1
    print (f"|",nmbr,"|",show_f_l,nmbr_spc_sfl*spc,"|")
    nmbr+=1
    print (f"|",nmbr,"|",show_s_l,nmbr_spc_ssl*spc,"|")
    nmbr+=1
    print (f"|",nmbr,"|",down_t,nmbr_spc_dt*spc,"|")
    nmbr+=1
    print (f"|",nmbr,"|",show_f_l_p,nmbr_spc_sflp*spc,"|")
    nmbr+=1
    print (f"|",nmbr,"|",show_f_l_url_d,nmbr_spc_sfl_url_d*spc,"|")
    print (f"+---+",nmbr_dsh*dsh,"+")
    nmbr=0
    print (f"|",nmbr,"|",skip,nmbr_spc_skp*spc,"|")
    print (f"+---+",nmbr_dsh*dsh,"+")
    #print (type(lngth_ns))
#Indvdl_optn()

