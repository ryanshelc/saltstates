git-core:
  pkg.installed

git clone https://ryanshelc@github.com/ryanshelc/opsgadget.git:
  cmd.run:
    - cwd: /root/

python-pip:
  pkg.installed 

python-virtualenv:
  pkg.installed

/root/opsgadget/venv/:
  virtualenv.managed:
    - name: /root/opsgadget/venv
    - cwd: /root/opsgadget/venv/
    - requirements: salt://devbase/piprequirements.txt
    - require:
      - pkg: python-virtualenv
 
startAppServer:
  cmd.run:
    - name: ". venv/bin/activate && gunicorn run:app --daemon"
    - cwd: /root/opsgadget/