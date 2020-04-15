import matplotlib as plt
import numpy as np
fig,ax=plt.subplots(1,1,figsize=(4,4))
x=np.linspace(0,5,6); y=x**2;
ax.plot(x[0:3],y[0:3],'o',color='orange',label='Low')
ax.plot(x[3:],y[3:],'o',color='cornflowerblue',label='High')
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.legend()
ax.set_title('Nice plot')
ax.grid(b=True, which='major', color='#999999', linestyle='-', alpha=0.2)
plt.savefig('niceplot.svg')
