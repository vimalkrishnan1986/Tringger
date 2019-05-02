CREATE TABLE [dbo].[VersionSettings](
	[VersionId] [int] IDENTITY(1,1) NOT NULL,
	[VersionNumber] [nvarchar](50) NULL,
	[AppUpdate] [bit] NULL,
	[ForceUpdate] [bit] NULL,
	[ErrorCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_VersionSettings] PRIMARY KEY CLUSTERED 
(
	[VersionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO