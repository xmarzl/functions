# -- static variables
my $regex_noncapturing = '^(?!#|\s+$|$)';

# -- open file as hash
sub open_file_hash($$) {
  my $f_file = shift;
  my $f_separator = shift;
  
  open(my $f_file_handler, '<', $f_file);

    # --- exclude comment, whitespace, empty lines
    my @f_file_lines = grep(/$regex_noncapturing/,(<$f_file_handler>));

  close($f_file_handler);

  # --- remove returns
  chomp @f_file_lines;

  # --- split into hash
  my %f_hash = map { split(/$f_separator/, $_) } @f_file_lines;

  return %f_hash;
}


## usage ##
my %new_hash = open_file_hash('path_to_file', ':');
