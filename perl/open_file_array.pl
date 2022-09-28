# -- static variables
my $regex_noncapturing = '^(?!#|\s+$|$)';

# -- open file as array
sub open_file_array($) {
  my $f_file = shift;
  open(my $f_file_handler, '<', $f_file);

    # --- exclude comment, whitespace, empty lines
    my @f_file_lines = grep(/$regex_noncapturing/,(<$f_file_handler>)) || ();

    # --- remove returns
    chomp @f_file_lines;

  close($f_file_handler);
  return @f_file_lines;
}


## usage ##
my @new_array = open_file_array('path_to_file');