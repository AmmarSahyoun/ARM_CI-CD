## Continuous deployment using separate ARM templates for json and Bicep
#### - CI checks on PR to ensure templates quality and consistency.
#### - CD pipeline triggers only if changes happened in a specific directory.

### CI checks:

* Bicep Syntax Validation.
* Bicep Linter.
* Deployment Tests.
* Pull Request (PR) Checks.
* Unit Testing with Mock Deployments.
* Security Scans.


### CD Workflow:

* Push to main branch triggers deployment tool.
* Changes happened in arm will triggers resources deployment using json.
* Changes happened in bicep will triggers resources deployment using bicep.

### Benefits:
1. Automated deployment avoids manual errors
2. Maintain code history through Version control.
3. Collaborative development
4. Add peer-review test on PR in Dev layer.
5. Utilize Bicep templates for more readable and logical IaC.