<?xml version="1.0" encoding="UTF-8"?>
<validateThis xsi:noNamespaceSchemaLocation="validateThis.xsd" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<objectProperties>
		<property name="Message" desc="Message">
			<rule type="required" />
		</property>
		<property name="email" desc="Email Address">
			<rule type="required" />
			<rule type="email" failureMessage="Hey, dude, you call that an Email Address?" />
		</property>
	</objectProperties>
</validateThis>
