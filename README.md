## CD2H-analytics
Labs demonstration app regarding various aspects of CD2H (personnel, current projects, etc.)

Live access to this app is available at http://labs.cd2h.org/analytics

Current elements include

* A dashboard presenting current status of Phase 2 project milestones and issues
* A visualization of current projects and the CD2H personnel participating in them
* A display of all current projects and summary information pulled live from the GitHub V4 API using GraphQL
* A display of all current projects and summary information extracted from the Google Drive API. These data are cached in a local database and accessed via GraphQL queries using PostGraphile
* A *currently very slow* search interface for text harvested off the CTSA Consortium hub websites.  This is meant solely as a proof-of-concept for a tool to identify hubs using particular tools/services.  Try "TriNetX" as an example.
