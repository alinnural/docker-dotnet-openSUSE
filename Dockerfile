FROM microsoft/aspnetcore-build:2.0
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out
RUN ls
RUN ls out
WORKDIR /app/out

# build runtime image
# FROM microsoft/aspnetcore:2.0
# WORKDIR /app
# COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "webyo.dll"]