""" A python module to facilitate the deployment of Terraform on Jenkins

An AWS timed token is generated using user credentials stored on Jenkins,
which are then used to execute Terraform commands on a specified account.
"""

# Standard Library
import sys
import logging
import subprocess
from subprocess import CalledProcessError

# None Standard Libraries
from .modules import execution_environment

# Constants

LOGGER = logging.getLogger()
"""Setting up logging
"""

# Setting debugging level
LOGGER.setLevel(logging.DEBUG)


def execute_terraform(terraform_bin_path, username, password, role, wrk_dir,
                      action, region, switch_role=None, parallelism=True):
    """A function to manage the Plan and Apply of Terraform, based of user
    input in Jenkins.

    Arguments:
        terraform_bin_path (str): Terraform path.
        username (str): ADFS service account username.
        password (str): ADFS service account password.
        role (str): Aws ADFS IAM role.
        wrk_dir (str): Terraform working directory.
        action (str): Terraform action.
        region (str): Aws region.

    Keyword Arguments:
        switch_role (str): The account to switch into.
        parallelism (str): Whether to run concurrent Terraform operations or
                           not.

    Raises:
        CalledProcessError: Subprocess execution error.
    """
    aws_env = execution_environment.AWSEnvironment(username,
                                                   password,
                                                   role,
                                                   switch_role,
                                                   region
                                                   )
    env = aws_env.get_aws_tokens(session_name='389715306404')

    commands = [terraform_bin_path, action]
    try:
        init_args = [terraform_bin_path, 'init']

        subprocess.run(init_args, cwd=wrk_dir, env=env, check=True)

        if action != 'plan':
            commands.append('-auto-approve=true')

        if parallelism:
            commands.append('-parallelism=1')

        subprocess.run(commands, cwd=wrk_dir, env=env, check=True)

    except CalledProcessError as terraform_error:
        LOGGER.error("Error running:\n%s\nOutput:\n%s", terraform_error.cmd,
                     terraform_error.stderr)
        sys.exit(1)
