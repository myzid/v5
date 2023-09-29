# `INSTALL SCRIPT`
<pre><code>sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update -y && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/myzid/v5/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && ./setup.sh</code></pre>

# `UPDATE SCRIPT`
<pre><code>wget https://raw.githubusercontent.com/myzid/v5/main/update.sh && chmod +x update.sh && ./update.sh</pre></code>
