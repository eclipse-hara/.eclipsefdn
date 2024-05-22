local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-hara') {
  settings+: {
    blog: "https://projects.eclipse.org/projects/iot.hawkbit.hara",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Eclipse Hara™ provides a reference agent software implementation featuring the Eclipse hawkBit device API.",
    email: "webmaster@eclipse-foundation.org",
    name: "Eclipse Hara",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('hara-ddiclient') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Hara-ddiclient is a Kotlin library that facilitates and speeds up the development of DDI API clients for devices connecting to hawkBit servers.",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      homepage: "https://projects.eclipse.org/projects/iot.hawkbit.hara",
      topics+: [
        "ddi",
        "eclipse",
        "hawkbit",
        "kotlin-library"
      ],
      web_commit_signoff_required: false,
      secrets: [
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "********",
        },
      ],
      variables: [
        orgs.newRepoVariable('SONAR_CLOUD_ORGANIZATION') {
          value: "eclipse-hara\r\n",
        },
        orgs.newRepoVariable('SONAR_CLOUD_PROJECT_KEY') {
          value: "eclipse-hara_hara-ddiclient",
        },
        orgs.newRepoVariable('SONAR_CLOUD_PROJECT_NAME') {
          value: "hara-ddiclient",
        },
      ],
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
    },
  ],
}
