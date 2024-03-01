local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-hara') {
  settings+: {
    blog: "https://projects.eclipse.org/projects/iot.hawkbit.hara",
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "Eclipse Hara™ provides a reference agent software implementation featuring the Eclipse hawkBit device API.",
    email: "webmaster@eclipse-foundation.org",
    members_can_change_project_visibility: false,
    name: "Eclipse Hara",
    packages_containers_internal: false,
    packages_containers_public: false,
    plan: "free",
    readers_can_create_discussions: true,
    two_factor_requirement: false,
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
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
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
          value: "eclipse\r\n",
        },
        orgs.newRepoVariable('SONAR_CLOUD_PROJECT_KEY') {
          value: "eclipse_hara-ddiclient",
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