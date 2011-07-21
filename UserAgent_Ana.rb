def anauseragent(access_files)

  total_hits = 0;
  error_404 = 0;
  error_50x = 0;
  
  ie_all = 0;
  ie_v6 = 0;
  ie_v7 = 0;
  ie_v8 = 0;
  ie_v9 = 0;

  ff_all = 0;
  ff_v2 = 0;
  ff_v3 = 0;
  ff_v4 = 0;
  ff_v5 = 0;

  chrome_all = 0;

  safari_all = 0;

  others = 0;

  internal_hit = 0;

  i = 0;
  arr_size = access_files.size
  
  while i < arr_size
    current_file = access_files[i];
    open(current_file).each{ |line|

      if line =~ /"\s404\s/
        error_404 = error_404 + 1;
      end

      if line =~ /"\s50\d\s/
        error_50x = error_50x + 1;
      end

      if line =~ /"-"/
        internal_hit = internal_hit + 1;
        #do nothing about it
        next;
      end

      total_hits = total_hits +1;

      if line =~ /MSIE\s6\.0/i
        ie_all = ie_all + 1;
        ie_v6 = ie_v6 +1;
        next;arr_size
      end

      if line =~ /MSIE\s7\.0/i
        ie_all = ie_all + 1;
        ie_v7 = ie_v7 +1;
        next;
      end

      if line =~ /MSIE\s8\.0/i
        ie_all = ie_all + 1;
        ie_v8 = ie_v8 +1;
        next;
      end

      if line =~ /MSIE\s9\.0/i
        ie_all = ie_all + 1;
        ie_v9 = ie_v9 +1;
        next;
      end

      if line =~ /Firefox\/5\./i
        ff_all = ff_all + 1;
        ff_v5 = ff_v5 +1;
        next;
      end

      if line =~ /Firefox\/4\./i
        ff_all = ff_all + 1;
        ff_v4 = ff_v4 +1;
        next;
      end

      if line =~ /Firefox\/3\./i
        ff_all = ff_all + 1;
        ff_v3 = ff_v3 +1;
        next;
      end

      if line =~ /Firefox\/2\./i
        ff_all = ff_all + 1;
        ff_v2 = ff_v2 +1;
        next;
      end

      if line =~ /Chrome\//i
        chrome_all = chrome_all + 1;
        next;
      end

      #Due to Safari header
      if line =~ /Safari\//i
        safari_all = safari_all + 1;
        next;
      end

    #Unknown browser Type
      others =  others + 1;

    }
    i = i + 1;
end
  ie_all_usage = ((ie_all/total_hits.to_f)*100).round;
  ie_v6_usage = ((ie_v6/total_hits.to_f)*100).round;
  ie_v7_usage = ((ie_v7/total_hits.to_f)*100).round;
  ie_v8_usage = ((ie_v8/total_hits.to_f)*100).round;
  ie_v9_usage = ((ie_v9/total_hits.to_f)*100).round;
  
  ff_all_usage = ((ff_all/total_hits.to_f)*100).round;
  ff_v2_usage = ((ff_v2/total_hits.to_f)*100).round;
  ff_v3_usage = ((ff_v3/total_hits.to_f)*100).round;
  ff_v4_usage = ((ff_v4/total_hits.to_f)*100).round;
  ff_v5_usage = ((ff_v5/total_hits.to_f)*100).round;

  chrome_all_usage = ((chrome_all/total_hits.to_f)*100).round;

  safari_all_usage = ((safari_all/total_hits.to_f)*100).round;

  others_usage = ((others/total_hits.to_f)*100).round;

  error_404_rate = ((error_404/(total_hits+internal_hit).to_f)*100).round;

  error_50x_rate = ((error_50x/(total_hits+internal_hit).to_f)*100).round;
  
  print "Total hits: #{total_hits}\n" ;
  print "IE Family: #{ie_all} -- #{ie_all_usage}%\n";
  print "IE 6.0 : #{ie_v6} -- #{ie_v6_usage}%\n" ;
  print "IE 7.0 : #{ie_v7} -- #{ie_v7_usage}%\n" ;
  print "IE 8.0 : #{ie_v8} -- #{ie_v8_usage}%\n" ;
  print "IE 9.0 : #{ie_v9} -- #{ie_v9_usage}%\n" ;

  print "Firefox Family: #{ff_all} -- #{ff_all_usage}%\n" ;
  print "Firefox 2.0: #{ff_v2} -- #{ff_v2_usage}%\n";
  print "Firefox 3.0: #{ff_v3} -- #{ff_v3_usage}%\n";
  print "Firefox 4.0: #{ff_v4} -- #{ff_v4_usage}%\n";
  print "Firefox 5.0: #{ff_v5} -- #{ff_v5_usage}%\n";

  print "Chrome: #{chrome_all} -- #{chrome_all_usage}%\n";

  print "Safari (include iPad Version): #{safari_all} -- #{safari_all_usage}%\n";

  print "Others: #{others} -- #{others_usage}%\n";

  print "Internal Hits: #{internal_hit}\n";

  print "404 Error--Rate%: #{error_404} -- #{error_404_rate}%\n";

  print "50x Error--Rate%: #{error_50x} -- #{error_50x_rate}%\n";
end

src_file1 = "D:\\GWT_automation\\release\\0718\\CBSWeb01LOG\\glcng-access.2011-07-18-18.log"
files_arr = Array[src_file1];
anauseragent(files_arr)