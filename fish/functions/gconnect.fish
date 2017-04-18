function gconnect
  set machine $argv[1]
  set env $argv[2]

  switch $env
    case "staging"
        gcloud compute --project "databerries-staging" ssh --zone "europe-west1-d" $machine
    case "production"
        gcloud compute --project "databerries" ssh --zone "europe-west1-d" $machine
    end
end
