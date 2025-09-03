from choices import *
from singles import *
#from output import *
def main():
    Indvdl_optns()
    print ("Choose")
    chs=input()
    if chs =="1":
        print ("Enter url video")
        url=input()
        filename="./down_history.json"
        
        # fun print url in url text file
        save_url(url)
        
        sfl= down_singles_video(url,filename,"")
        sfl.show_format_list()

        sf=down_singles_video(url,filename,"")

        #lct_save=down_singles_video(url,filename,"")
        #lct_save.output_lct_()

        sf=down_singles_video(url,filename,"")

        sf.select_format()

        s_data= down_singles_video(url,filename,"")
        s_data.manage_data() 




    elif chs =="2":
        print ("Show subtitles list")
        print ("Enter url video")
        url=input()

        # fun print url in url text file
        save_url(url)

        subtl=down_singles_video(url)
        subtl.show_subtitle_list()

    elif chs=="3":
        down=down_singles_video(url)
        down.download()
    elif chs=="4":
        print("welcom playlist")

    elif chs=="5":
        print("url done")

    elif chs=="6":
        print("resume section")
        s_data= down_singles_video("mahmoud","hd")
        s_data.manage_data("./down_history.json") 

    elif chs=="0":
        def Method_Download_URL():
            print("Methods section")
            fun_method_download()
            print("Choose")
            chs=input()
            if chs=="1":
                fun_method_d_F_url()
                print("Choose option")
                chs_opt=input()
                if chs_opt=="1":
                    print("enter format option")
                    sf=down_singles_video(url,filename,"")          
                    #lct_save=down_singles_video.output_lct_()
                    #sf=down_singles_video(url,filename,lct_save)
                    sf.select_format()


                elif chs_opt=="2":
                    print("enter location")

                elif chs_opt=="3":
                    print("enter playlist")

                elif chs_opt=="u":
                    print("undo")
                    Method_Download_URL() 
                    #main()

                elif chs_opt=="d":
                    print("Download")

                elif chs=="2":
                    print(chs)
                    print("Download from file")

                elif chs=="u":
                    print("Return")
                    main()
       
            elif chs=="2":
                print("download from file")

            elif chs=="u":
                main()
            else:
                print("out script")

        Method_Download_URL()


    else:
        print(chs)
        print ("out")
main()


