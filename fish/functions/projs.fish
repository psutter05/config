function projs
  set project_name $argv[1]
  set project_path $project_base_path/$project_name

  if not count $argv > /dev/null
    echo Available projects:
    ls $project_base_path
  else if not test -e $project_path
    echo Available projects:
    ls $project_base_path
  else
    cd $project_path
  end
end
