def Indvdl_optns():
    name_slide="choose"
    show_QD_BF="Quick download and Best format"
    show_f_l="Show formatting list"
    down_t="Download Thumbnails"
    show_f_l_p="Show formatting list (playlist)"
    show_f_l_url_d="Download uncompleted URL"
    show_history_down ="Show history download"
    show_resume="Show resume dowload video"
    skip="Skip"

    lngth_ns = len(name_slide)
    lngth_sfl = len(show_f_l)
    lngth_qd_bf = len(show_QD_BF)
    lngth_dt = len(down_t)
    lngth_sflp = len(show_f_l_p)
    lngth_sfl_url_d = len(show_f_l_url_d)
    lngth_shd = len(show_history_down)
    lngth_resume = len(show_resume)
    lngth_skp = len(skip)

    nmbr_spc_ns=37 - lngth_ns
    nmbr_spc_sfl=37 - lngth_sfl
    nmbr_spc_qd_bf=37 - lngth_qd_bf
    nmbr_spc_dt=37 - lngth_dt
    nmbr_spc_sflp=37 - lngth_sflp
    nmbr_spc_sfl_url_d=37 - lngth_sfl_url_d
    nmbr_spc_shd=37 - lngth_shd
    nmbr_spc_resume = 37 - lngth_resume
    nmbr_spc_skp=37 - lngth_skp

    spc=" "
    dsh="-"
    nmbr_dsh=38
    print (f"+---+",nmbr_dsh*dsh,"+")
    print (f"| \\ |",name_slide,nmbr_spc_ns*spc,"|")
    print (f"+---+",nmbr_dsh*dsh,"+")
    nmbr=1
    print (f"|",nmbr,"|",show_QD_BF,nmbr_spc_qd_bf*spc,"|")
    nmbr+=1
    print (f"|",nmbr,"|",show_f_l,nmbr_spc_sfl*spc,"|")
    nmbr+=1
    print (f"|",nmbr,"|",down_t,nmbr_spc_dt*spc,"|")
    nmbr+=1
    print (f"|",nmbr,"|",show_f_l_p,nmbr_spc_sflp*spc,"|")
    nmbr+=1
    print (f"|",nmbr,"|",show_f_l_url_d,nmbr_spc_sfl_url_d*spc,"|")
    nmbr+=1
    print (f"|",nmbr,"|",show_history_down, nmbr_spc_shd*spc,"|")
    nmbr+=1
    print (f"|",nmbr,"|",show_resume, nmbr_spc_resume*spc,"|")
    print (f"+---+",nmbr_dsh*dsh,"+")
    nmbr=0
    print (f"|",nmbr,"|",skip,nmbr_spc_skp*spc,"|")
    print (f"+---+",nmbr_dsh*dsh,"+")
    #print (type(lngth_ns))

def fun_method_download(): 
    name_slide="Methods"
    down_F_url="Download from URL"
    down_F_file="Download from file"
    undo="Return"

    lngth_ns = len(name_slide)
    lngth_down_F_url = len(down_F_url)
    lngth_down_F_file = len(down_F_file)
    lngth_undo = len(undo)

    nmbr_spc_ns=37 - lngth_ns
    nmbr_spc_d_F_url=37 - lngth_down_F_url
    nmbr_spc_d_F_file=37 - lngth_down_F_file
    nmbr_spc_undo=37 - lngth_undo

    spc=" "
    dsh="-"
    nmbr_dsh=38
    print (f"+---+",nmbr_dsh*dsh,"+")
    print (f"| \\ |",name_slide,nmbr_spc_ns*spc,"|")
    print (f"+---+",nmbr_dsh*dsh,"+")
    nmbr=1
    print (f"|",nmbr,"|",down_F_url,nmbr_spc_d_F_url*spc,"|")
    nmbr+=1
    print (f"|",nmbr,"|",down_F_file,nmbr_spc_d_F_file*spc,"|")
    nmbr+=1
    print (f"+---+",nmbr_dsh*dsh,"+")
    nmbr=0
    print (f"|","u","|",undo,nmbr_spc_undo*spc,"|")
    print (f"+---+",nmbr_dsh*dsh,"+")

def fun_method_d_F_url():

    name_slide="Options download from URL"
    opt_enter_format="Enter video formatting"
    opt_output_lct="Output location"
    opt_playlist="playlist download"
    undo="Return"
    download_url="Download"

    lngth_ns = len(name_slide)
    lngth_opt_enter_format = len(opt_enter_format)
    lngth_opt_lct = len(opt_output_lct)
    lngth_playlist = len(opt_playlist)
    lngth_undo = len(undo)
    lngth_down_url = len(download_url)

    nmbr_spc_ns=37 - lngth_ns
    nmbr_spc_opt_enter_format=37 - lngth_opt_enter_format
    nmbr_spc_opt_lct=37 - lngth_opt_lct
    nmbr_spc_opt_playlist=37 - lngth_playlist
    nmbr_spc_undo=37 - lngth_undo
    nmbr_spc_down_url=37 - lngth_down_url

    spc=" "
    dsh="-"
    nmbr_dsh=38
    print (f"+---+",nmbr_dsh*dsh,"+")
    print (f"| \\ |",name_slide,nmbr_spc_ns*spc,"|")
    print (f"+---+",nmbr_dsh*dsh,"+")
    nmbr=1
    print (f"|",nmbr,"|",opt_enter_format,nmbr_spc_opt_enter_format*spc,"|")
    print (f"|",nmbr,"|",opt_output_lct,nmbr_spc_opt_lct*spc,"|")
    nmbr+=1
    print (f"|",nmbr,"|",opt_playlist,nmbr_spc_opt_playlist*spc,"|")
    nmbr+=1
    print (f"+---+",nmbr_dsh*dsh,"+")
    nmbr=0
    print (f"|","u","|",undo,nmbr_spc_undo*spc,"|")
    print (f"|","d","|",download_url,nmbr_spc_down_url*spc,"|")
    print (f"+---+",nmbr_dsh*dsh,"+")


