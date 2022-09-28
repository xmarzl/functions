#!/usr/bin/env perl

# -- static variable
my $localtime_simple_pattern = '.{4}(...) {1,2}(\d{1,2}) (\d\d):(\d\d):(\d\d) (\d{4})';

# -- subs
# --- split unix locatime (datetime) into variables
sub localtime_simple() {
  my %f_month_number = ('Jan'=>'01', 'Feb'=>'02', 'Mar'=>'03',
                 'Apr'=>'04', 'May'=>'05', 'Jun'=>'06',
                 'Jul'=>'07', 'Aug'=>'08', 'Sep'=>'09',
                 'Oct'=>'10', 'Nov'=>'11', 'Dec'=>'12');
  
  my ($f_month,$f_day,$f_hour,$f_minute,$f_second,$f_year) = localtime =~ m/$localtime_simple_pattern/;
  
  # ---- day contains always to numbers, even if its < 10
  $f_day = sprintf("%02d",$f_day);
  
  # ---- translate month into numbers
  $f_month = $f_month_number{$f_month};
  
  return ($f_day ,$f_month ,$f_year,
          $f_hour,$f_minute,$f_second);
};

## usage ##
my ($day, $month, $year, $hour, $minute, $second) = &localtime_simple();

print $year.'.'.$month.'.'.$day.' - '.$hour.':'.$minute.':'.$second."\n";
