<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>

    <xsl:template match="/transcript">
        <xsl:for-each select="text">
            <xsl:value-of select="position()"/>
            <xsl:text>&#10;</xsl:text>
            <xsl:call-template name="timestamp">
                <xsl:with-param name="abstime" select="@start"/>
            </xsl:call-template>
            <xsl:text> --> </xsl:text>
            <xsl:call-template name="timestamp">
                <xsl:with-param name="abstime" select="@start + @dur"/>
            </xsl:call-template>
            <xsl:text>&#10;</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>&#10;&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="timestamp">
        <xsl:param name="abstime"/>
        <xsl:variable name="inttime" select="floor($abstime)" as="xs:integer"/>
        <xsl:value-of select='format-number(floor($inttime div 3600),"00")'/>
        <xsl:text>:</xsl:text>
        <xsl:value-of select='format-number(floor($inttime div 60) mod 60,"00")'/>
        <xsl:text>:</xsl:text>
        <xsl:value-of select='format-number($inttime mod 60,"00")'/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select='format-number(round(($abstime - $inttime) * 1000),"000")'/>
    </xsl:template>
</xsl:stylesheet>
