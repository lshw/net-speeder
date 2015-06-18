all:	net_speeder

net_speeder:	
	gcc -o net-speeder net_speeder.c -lpcap -lnet 
	gcc -o venet-speeder net_speeder.c -lpcap -lnet  -DCOOKED


clean:	
	rm -f net_speeder  venet_speeder


install: 
	install -d $(DESTDIR)/usr/sbin/
	install -m 0755 net-speeder $(DESTDIR)/usr/sbin/
	echo install -m 0755 net-speeder $(DESTDIR)/usr/sbin/
	install -m 0755 venet-speeder $(DESTDIR)/usr/sbin/

# DO NOT DELETE
