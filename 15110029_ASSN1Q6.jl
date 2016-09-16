#function that calculates the number of significant figures

function sfd(st)

l=length(st)

c=0

ind=0

for i in 1:l

if (st[i]!=&#39;0&#39;)&amp;&amp;(st[i]!=&#39;.&#39;)

ind=i

break

else

continue

end

end

if ind==0

return(c)

end

if search(st,&#39;.&#39;)==0

for i in l:-1:ind

if st[i]!=&#39;0&#39;

c=i+1-ind

break

else

continue

end

end

else

for i in ind:l

if st[i]!=&#39;.&#39;

c=c+1

else

continue

end

end

end

return(c)

end

#Dictionary containing the conversion factors and units

convfact=Dict(1=&gt;[&quot;Mass&quot;,&quot;lb&quot;,0.45359237,&quot;kg&quot;], 2=&gt;[&quot;Length&quot;,&quot;ft&quot;,0.3048,&quot;m&quot;],

3=&gt;[&quot;Temperature Difference&quot;,&quot;F&quot;,0.55,&quot;K&quot;], 4=&gt;[&quot;Volume&quot;,&quot;gallon&quot;,0.00454609,&quot;m^3&quot;],

5=&gt;[&quot;Force&quot;,&quot;dyne&quot;,0.00001,&quot;N&quot;], 6=&gt;[&quot;Pressure&quot;,&quot;atm&quot;,101325,&quot;Pa&quot;],

7=&gt;[&quot;Power&quot;,&quot;hp&quot;,746,&quot;W&quot;], 8=&gt;[&quot;Density&quot;,&quot;lb/ft^3&quot;,16.018465,&quot;kg/m^3&quot;],

9=&gt;[&quot;Speed&quot;,&quot;km/h&quot;,3.6,&quot;m/s&quot;], 10=&gt;[&quot;Time&quot;,&quot;min&quot;,60,&quot;s&quot;]);

#function that evaluates the conversion in the appropriate number of significant figures

function getsfd(pr,m)

dp=search(pr,&#39;.&#39;)

l=length(pr)

c=0

ind=0

for i in 1:l

if (pr[i]!=&#39;0&#39;)&amp;&amp;(pr[i]!=&#39;.&#39;)

ind=i

break

else

continue

end

end

if ind==0

return(c)

end

if dp==0

c=convert(Int64,round(parse(Float64,pr),(m-l)))

else

for i in ind:l

if (pr[i]!=&#39;.&#39;)

if(m&gt;0)

m=m-1

elseif (m==0)&amp;&amp;(i&lt;dp)

c=convert(Int64,round(parse(Float64,pr),i-dp))

break

elseif (m==0)&amp;&amp;(i&gt;dp)

c=round(parse(Float64,pr),i-dp- 1)

break

end

else

continue

end

end

end

return(c)

end

println(&quot;Enter the number corresponding to the property you choose: &quot;)

for i in 1:10

println(i,&quot;.&quot;,convfact[i][1])

end

p=parseint(chomp(readline()));

println(&quot;Enter the &quot;,convfact[p][1],&quot; in &quot;,convfact[p][2])

der=parseint(chomp(readline()));

m=min(sfd(&quot;$der&quot;),sfd(&quot;$convfact[p][3]&quot;));

ans=getsfd(&quot;$(z*convfact[p][3])&quot;,m);

println(&quot;Answer : &quot;,der,&quot; &quot;,convfact[p][2],&quot; = &quot;,ans,&quot; &quot;,convfact[p][4])