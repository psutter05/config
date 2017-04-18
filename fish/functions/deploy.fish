function deploy
  set mode $argv[1]

  switch $mode
    case "staging"
      echo "Deploying in staging"
      ansible-playbook -i inventory/staging/gce.py --extra-vars "project=staging" site.yml
    case "production"
      echo "Deploying in production"
      ansible-playbook -i inventory/production/gce.py --extra-vars "project=production" site.yml
    case "*"
      echo "Invalid argument, first argument must be staging or production"
    end
end
